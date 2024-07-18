As we have completed the book, it is now time to gain hands-on experience with a real-world application. For this, we can use [NeetoForm](https://neeto-form-web-playwright.neetodeployapp.com/login). NeetoForm is an application designed to facilitate the creation and management of forms.

Apart from just automating the tests, ensure that you adhere to all the best practices and concepts mentioned in this book. Additionally, you can refer to the official Playwright documentation for advanced topics. Also, do not forget to perform a proper cleanup after performing each test to maintain a clean and consistent test environment, which is shared by everyone performing this task. Note that, the clean up steps have not been explicitly mentioned in the steps. We trust you to come up with them.

## Create and submit a form

1. Click on `Add new form`.
2. Click on `Start from scratch`.
3. Add full name and phone numer fields to the form.
4. Publish the form.
5. Open the published form by clicking on the `View published version` button.
6. Check if all the fields are visible in the published form.
7. Check if the fields throw error when filled with invalid emails and phone numbers.
8. Check if the form can be submitted without filling any fields.
9. Fill in values to the fields and submit the form. (Add United states number)
10. Verify that the Thank you page is visible.
11. Go back to the form build tab and click on submissions.
12. Verify the newly submitted response is visible.

[Demo video](https://shreya-kurian.neetorecord.com/watch/7f0eabb3-5482-4c3b-b5d1-916961ecb281)

## Customize form's field elements

1. Create a new form and add single and multi choice elements.
2. Add six more options to both single and mutli choice elements.
3. Hide the multi choice question.
4. Randomize the options of single element by clicking on the randomize option.
5. Publish the form and open the published form by clicking on the `View published version` button.
6. Ensure that the options of single choice element are randomized.
7. Verify the multi choice element is hidden.
8. Uncheck the hide option of multichoice element and publish the form.
9. Ensure the field is now visible on the published form.

[Demo video](https://shreya-kurian.neetorecord.com/watch/5152a8bc-6fe7-4192-aa48-0f6a6115f530)

## Verify form insights

1. Create a new form.
2. Verify the visits, starts, submissions count and completion rate is 0 in the insights tab under submissions.
3. Open the published form.
4. Verify the visits count has increased by one.
5. Open the published form again and type in a value to the field without submitting the form.
6. Verify the visits and starts count has increased by one.
7. Open the published form again and submit the form.
8. Verify the visits, starts and submissions count has increased by one. Also verify the completion rate.

[Demo video](https://shreya-kurian.neetorecord.com/watch/24072ffa-2ca6-4932-87d7-7b202bcca1c4)
