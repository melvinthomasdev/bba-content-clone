# This method is responsible for shifting or reversing the shift of a chapter(folder)
# within a course. It allows for inserting a new chapter with the desired chapter number
# and overriding the sequence of subsequent chapters.
#
# For example, if you want to add a chapter 'rails-history' with chapter number 5 in the
# 'learn-rubyonrails-course,' you should first create a folder named "rails-history" with
# the desired content in the 'learn-rubyonrails/chapters' directory. Then, you can run
# this command to shift the chapter:
#
#   ruby scripts/chapter_shifter.rb learn-rubyonrails rails-history 5
#
# After the successful execution of the script, the content of the 'rails-history' chapter
# will be moved to a folder named '0050-rails-history' effectively changing its chapter
# number.
#
# When used with the --reverse option, this method will reverse the shift, moving the
# chapter back to its original state without the chapter number prefix.
#
# Arguments:
#   - course_name: The name of the course.
#   - chapter_name: The name of the chapter to be shifted or reversed.
#   - desired_chapter_no: The desired chapter number to set or reverse.
#   - reverse: A boolean flag indicating whether to reverse the shift (default: false).
#
# Note: The 'course_name' and 'chapter_name' should match the actual directory structure,
# and 'desired_chapter_no' should be an integer.
#
# Example usage:
#   To shift a chapter, run the below command from the root of the project:
#     ruby scripts/chapter_shifter.rb learn-rubyonrails rails-history 5
#   To reverse the shift, run the below command from the root of the project:
#     ruby scripts/chapter_shifter.rb --reverse learn-rubyonrails rails-history 5
#
# This method performs the following actions:
#   - Checks if the required folders and conditions are present.
#   - Shifts the chapter to the desired chapter number (or reverses the shift).
#
# The '--reverse' option can be used to specify the reverse functionality.


require 'optparse'

class ChapterShifter

  attr_reader :course_full_path, :chapter_name, :desired_chapter_no, :reverse

  def initialize(course_name, chapter_name, desired_chapter_no, options)
    folder_path = "courses/#{course_name}/chapters"
    @course_full_path = "#{File.expand_path(Dir.pwd)}/#{folder_path}"
    @chapter_name = chapter_name
    @desired_chapter_no = desired_chapter_no.to_i
    @reverse = options[:reverse]
  end

  def process
    if folders_present? && desired_chapter_no_present?
      reverse ? reverse_shift_chapter : shift_chapters
    else
      raise_no_file_present
    end
  end

  private

    def parent_folder_exists?
      Dir.exists?(course_full_path)
    end

    def folders_present?
      parent_folder_exists? && chapter_folder_exists?
    end

    def chapter_folder_exists?
      Dir.exists?("#{course_full_path}/#{reverse ? desired_chapter_name : chapter_name}")
    end

    def desired_chapter_no_present?
      Dir.entries(course_full_path)
         .any? { |f| folder_name_matches?(f) }
    end

    def folder_name_matches?(folder_name)
      folder_name =~ /^0*#{desired_chapter_no}0-/i
    end

    def raise_no_file_present
      raise "No chapter present with the desired chapter no, please recheck your input. Ensure prefixed filename exists if --reverse option is passed"
    end

    def shift_chapters
      chapters_to_shift = Dir.entries(course_full_path)
                          .select { |f| shift_chapter?(f) }
                          .sort_by { |f| chapter_no_by_folder_name(f) }


      Dir.chdir(course_full_path)

      chapters_to_shift.each do |folder_name|
        new_chapter_no = chapter_no_by_folder_name(folder_name).next
        final_name = folder_name.sub(/^\d+-/i, "#{prefixed_chapter_no(new_chapter_no)}-")

        system("git mv #{folder_name} #{final_name}")
      end

      system("mv #{chapter_name} #{desired_chapter_name}")
    end

    def reverse_shift_chapter
      chapters_to_shift = Dir.entries(course_full_path)
                          .select { |f| reverse_shift_chapter?(f) }
                          .sort_by { |f| chapter_no_by_folder_name(f) }

      Dir.chdir(course_full_path)

      chapters_to_shift.each do |folder_name|
        new_chapter_no = chapter_no_by_folder_name(folder_name) - 1
        final_name = folder_name.sub(/^\d+-/i, "#{prefixed_chapter_no(new_chapter_no)}-")

        system("git mv #{folder_name} #{final_name}")
      end

      system("mv #{desired_chapter_name} #{chapter_name}")
    end

    def desired_chapter_name
      "#{prefixed_chapter_no(desired_chapter_no)}-#{chapter_name}"
    end

    def prefixed_chapter_no(chapter_no)
      "#{chapter_no.to_s.rjust(3, '0')}0"
    end

    def shift_chapter?(folder_name)
      chapter_no_by_folder_name(folder_name) >= desired_chapter_no
    end

    def reverse_shift_chapter?(folder_name)
      chapter_no_by_folder_name(folder_name) > desired_chapter_no
    end

    def chapter_no_by_folder_name(folder_name)
      folder_name && folder_name.scan(/\d+/)
                            .first
                            .to_i/10
    end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby scripts/chapter_shifter.rb [options] course_name chapter_name desired_chapter_no"

  opts.on("--reverse", "Reverse the chapter shift (remove chapter number prefix)") do
    options[:reverse] = true
  end
end.parse!

course_name, chapter_name, desired_chapter_no = ARGV

ChapterShifter.new(course_name, chapter_name, desired_chapter_no, options).process
