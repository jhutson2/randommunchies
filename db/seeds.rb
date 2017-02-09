# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipe = Recipe.create(
  name:"Simple Baked Chicken Breasts",
  instructions:"Preheat convection oven to 400 degrees F (200 degrees C). Rub chicken breasts with olive oil and sprinkle both sides with salt and Creole seasoning. Place chicken in a broiler pan.
Bake in the preheated oven for 10 minutes. Flip chicken and cook until no longer pink in the center and the juices run clear, about 15 minutes more. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).
Remove chicken from pan. Pour water into the pan, while scraping the browned bits of food off of the bottom of the pan with a wooden spoon. Add more water if needed to dislodge the browned bits; serve alongside chicken.",
  recipe_image: File.open(Rails.root.join("db/seeds/images/chicken.jpeg"))
  )

recipe.ingredients.create(meat: "4 skinless, boneless chicken breast halves", seasoning: "1 pinch Creole seasoning (such as Tony Chachere's®), or to taste, 2 tablespoons olive oil, 1 tablespoon coarse sea salt")

recipe = Recipe.create(
  name:"Beef Stroganoff",
  instructions: "Sprinkle the steak strips with House Seasoning to light cover them, and then dust with flour. In a large skillet, quickly brown them on both sides in the olive oil and butter. Remove the steak from the pan. Add the onion slices and mushrooms to the pan drippings. Saute for a few minutes, until the onion is tender. Sprinkle with 1 teaspoon flour. Put the steak back into the pan with the onion and mushrooms. Add the mushroom soup and beef broth. Cook over low heat for about 30 minutes, covered. Adjust seasoning to taste, adding salt and pepper, as needed. Stir in the sour cream the last few minutes, right before you serve. Serve over cooked noodles.",
  recipe_image: File.open(Rails.root.join("db/seeds/images/beef.jpeg"))
)

recipe.ingredients.create(meat: "1 1/2 pounds cubed round steak, cut into thin strips. 1 (10 3/4-ounce) can beef broth", vegetable: "8 ounces fresh mushrooms, sliced. 1 (10 3/4-ounce) can cream of mushroom soup. 1 medium onion, sliced", seasoning: "All-purpose flour, 2 tablespoons olive oil, 2 tablespoons butter, Salt and black pepper, 1 cup sour cream, House Seasoning: 1 cup salt, 1/4 cup black pepper, 1/4 cup garlic powder", grain: "Cooked egg noodles")

recipe = Recipe.create(
  name: "Cauliflower Casserole",
  instructions: "Preheat the oven to 350 degrees Fahrenheit. Bring a medium pot of water to a boil and add the cauliflower florets. Boil for 5 minutes, or until nearly tender, and drain. In a medium mixing bowl, whisk the milk into the flour, then add the beaten egg, salt, pepper and 1 cup of the mozzarella cheese. Add the cooked cauliflower and stir to coat with the mixture. Pour the coated cauliflower mixture into a 7-inch-by-11-inch casserole dish. Sprinkle the remaining 1 cup of mozzarella on top. Bake on the top oven rack for 25 minutes, until the top is browned and the cauliflower is tender. Sprinkle with Parmesan and parsley, and enjoy!",
  recipe_image: File.open(Rails.root.join("db/seeds/images/cauliflower.jpg"))
)

recipe.ingredients.create(vegetable: "1 large head cauliflower, cut into florets (about 20 ounces florets)", seasoning: "1 teaspoon kosher salt, 1/2 teaspoon fresh ground black pepper, 2 cups shredded mozzarella cheese, 2 tablespoons grated Parmesan, 1 tablespoon chopped parsley", grain: "	2 tablespoons flour, 1 cup whole milk, 1 egg, beaten")
