# Rick And Morty iOS App 

iOS App using the [Rick And Morty API](https://rickandmortyapi.com) in SwiftUI. Developed for educational purposes.


![rm](https://user-images.githubusercontent.com/56734989/192112936-29368eb6-b63d-43ac-b750-c0152bfc1683.gif)

> Check out the videos in the issues to see how the app works!!

## Table of Contents

- [Editables](#Editables)  
- [Emphasis](#emphasis)  

## Editables
### Known bugs to be fixed in the future

- One of the components on the cards must be clicked to go to the detail page. (Image, text etc.) Clicking on the card itself should be enough.
- Since AsyncImage is a bit buggy, other alternatives can be used instead.
- When using the phone horizontally, the display of the detail screen should be responsive.

### Features to be added in the future

- When origin name is pressed on the detail page, a random location is shown on the map (with animation)
- Make the character detail page work with ID. Thus, on the Episodes detail page while the characters of that episode are listed,
clicking on any of the episode characters can go to the detail page of the relevant character.
- Enable the search feature on the Characters page (currently it only appears in the UI. It does not search or filter in the background)
- Add scrolling feature to the top of the page with sticky button action.

### Nice to have

- The form structure on the detail pages can be made into separate components.
- In the current structure, when the user scrolls to the bottom of the page, pagination is triggered and a new page is added to the existing list.
But after the currentPage is listed, its value increases by one.
Here an increment function of currentPage needs to be calculated and triggered as a separate event.
Also, currentPage should not increase by one after the new page is listed.
Instead, the new page should be listed after the currentPage has increased by one.

## Demo

Here is some screenshots of the app.

- *Light & Dark Apperance* - __Characters Page__

<img width="327" alt="image" src="https://user-images.githubusercontent.com/56734989/192114982-d66993e7-8c49-4ed7-bf32-c05fbe362690.png"> <img width="327" alt="image" src="https://user-images.githubusercontent.com/56734989/192114965-0938439f-4cb1-4ab4-bb4b-af424ce3c39e.png">

- *Light & Dark Apperance* - __Locations Page__

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115114-e8e8322f-15ef-4b49-9977-73dce36c59f7.png"> <img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115122-478e1aa9-f2d6-407a-aa03-f5f3489979bc.png">


- *Light & Dark Apperance* - __Episodes Page__

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115126-4dff3ecd-c0a7-416c-b8fe-aadca483a651.png"> <img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115130-c7015807-be73-4b4d-b9b2-185ec8e2d57c.png">

- *Light & Dark Apperance* - __Character Detail Page__

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115467-4c1adde9-f600-4fdf-97d5-b34f56c64666.png"> <img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115513-787c449b-5026-44fe-bd87-76ac962d76a1.png">


- *Light & Dark Apperance* - __Location Detail Page__

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115544-5d0e84eb-bb8a-498f-83dc-ef3bba97b644.png"> <img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115249-0b8f03e9-bc3c-4c50-9e2d-97d44cff2a1c.png">


- *Light & Dark Apperance* - __Episode Detail Page__

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115362-6df24528-8471-4bda-a724-93224bf0d925.png"> <img width="325" alt="image" src="https://user-images.githubusercontent.com/56734989/192115375-d7c5466a-15fa-4d5f-bbba-2ef0617873da.png">

## Acknowledgements
- [Rick And Morty API](https://rickandmortyapi.com)
- [Apollo iOS](https://www.apollographql.com)
- [Lottie Animation](https://lottiefiles.com)

## Contact me via

[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alper-cem-ozturk-a625671a8)
[](https://www.linkedin.com/in/alper-cem-ozturk-a625671a8) [![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@aalpercem)
[](https://medium.com/@aalpercem) [![Apple](https://img.shields.io/badge/Apple-%23000000.svg?style=for-the-badge&logo=apple&logoColor=white)](mailto:cemozturk0@icloud.com)
[](mailto:cemozturk0@icloud.com)

## See ya!
![rmflying](https://user-images.githubusercontent.com/56734989/192115977-68d874aa-d344-4898-98fc-afd0c7c2da40.gif)
