# rickandmorty
Rick and morty app for educational purposes.


Check out the videos in the issues to see how the app works.

Known bugs to be fixed in the future

- One of the components on the cards must be clicked to go to the detail page. (Image, text etc.) Clicking on the card itself should be enough.
- Since AsyncImage is a bit buggy, other alternatives can be used instead.
- When using the phone horizontally, the display of the detail screen should be responsive.

Features to be added in the future

- When origin name is pressed on the detail page, a random location is shown on the map (with animation)
- Make the character detail page work with ID. Thus, on the Episodes detail page while the characters of that episode are listed,
clicking on any of the episode characters can go to the detail page of the relevant character.
- Enable the search feature on the Characters page (currently it only appears in the UI. It does not search or filter in the background)
- Add scrolling feature to the top of the page with sticky button action.

Nice to have

- The form structure on the detail pages can be made into separate components.
- In the current structure, when the user scrolls to the bottom of the page, pagination is triggered and a new page is added to the existing list.
But after the currentPage is listed, its value increases by one.
Here an increment function of currentPage needs to be calculated and triggered as a separate event.
Also, currentPage should not increase by one after the new page is listed.
Instead, the new page should be listed after the currentPage has increased by one.
