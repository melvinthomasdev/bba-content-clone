Given is a data set of various groups of characters in Star wars.

```javascript
{
  factions: [
    {
      name: "Sith",
      wikiLink: "https://starwars.fandom.com/wiki/Order_of_the_Sith_Lords",
      characters: [
        {
          name: "Anakin Skywalker"
        },
        {
          name: "Kylo Ren"
        },
        {
          name: "Sheev Palpatine"
        }
      ]
    },
    {
      name: "Jedi",
      wikiLink: "https://starwars.fandom.com/wiki/Jedi",
      characters: [
        {
          name: "Yoda"
        }
        {
          name: "Luke Skywalker"
        },
        {
          name: "Obi-Wan Kenobi"
        },
        {
          name: "Ahsoka Tano"
        }
      ]
    },
    {
      name: "Mandalorian",
      wikiLink: "https://starwars.fandom.com/wiki/Mandalorian",
      characters: [
        {
          name: "Boba Fett"
        },
        {
          name: "Bo-Katan Kryze"
        },
        {
          name: "Grogu"
        }
      ]
    }
  ]
}
```

- Write a function called `countAllCharacters` which returns the total number of
  characters from the data-set.
- Write a function called `listEveryone` which returns a array of names of all
  the characters from the data-set in an array.
- Write a function called `nameWithA` which returns a array of names of all the
  characters whose name includes a or A.
- Write a function called `sortByFaction` which returns an object with the key
  of the name of the faction and value will be all the people in that faction in
  an array. For example:
  ```
  "Hutt": ["Jabba the Hutt", "Ziro the Hutt", "Mama"]
  ```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code here 
</code>
<solution>
const starWars = {
  factions: [
    {
      name: "Sith",
      wikiLink: "https://starwars.fandom.com/wiki/Order_of_the_Sith_Lords",
      characters: [
        {
          name: "Anakin Skywalker"
        },
        {
          name: "Kylo Ren"
        },
        {
          name: "Sheev Palpatine"
        }
      ],
    },
    {
      name: "Jedi",
      wikiLink: "https://starwars.fandom.com/wiki/Jedi",
      characters:[
        {
          name: "Yoda"
        },
        {
          name: "Luke Skywalker"
        },
        {
          name: "Obi-Wan Kenobi"
        },
        {
          name: "Ahsoka Tano"
        }
      ]
    },
    {
      name: "Mandalorian",
      wikiLink: "https://starwars.fandom.com/wiki/Mandalorian",
      characters: [
        {
          name: "Boba Fett"
        },
        {
          name: "Bo-Katan Kryze"
        },
        {
          name: "Grogu"
        }
      ]
    }
  ]
};

const countAllCharacters = object => { let totalCharacterNumber =
object.factions.reduce((total, currentValue) =>{ total +=
currentValue.characters.length; return total; }, 0);

return totalCharacterNumber; };

const listEveryone = object => { let characterList =
object.factions.reduce((total, currentValue) => {
currentValue.characters.map(character => total.push(character.name)); return
total; }, []); return characterList; };

const nameWithA = object => { let nameList = object.factions.reduce((total,
currentValue) => { currentValue.characters.map(character => {
character.name.includes("a" || "A") ? total.push(character.name) : null; });
return total }, []); return nameList; };

const sortByFaction = object => { let sortedFaction =
object.factions.reduce((total, currentValue) => { total[currentValue.name] =
currentValue.characters.map(character => character.name); return total; }, {});
return sortedFaction; };

console.log(countAllCharacters(starWars)); console.log(listEveryone(starWars));
console.log(nameWithA(starWars)); console.log(sortByFaction(starWars));

</solution>
</codeblock>
