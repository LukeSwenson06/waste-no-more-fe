# Waste No More
<details>
<summary> Table of Contents</summary>
<ol>
<li>About the Project</li>
<ul>
<li> Built With </li>
</ul>
<li> Getting Started </li>
<ul>
<li> Prerequisites </li>
<li> Installation </li>
</ul>
<li> Usage </li>
<li> Features </li>
<li> Contributions </li>
</ol>
</details>

## About the Project
 Waste No More is an application dedicated to help people reduce food waste at home by tracking food items, expiration dates, and help locate the nearest donation centers for food close to expiring. Using the built in notification system, users will be notified for food about to be expired and resources are provided to educate users on food waste management, food storage and how to donate food. This project was created for the 2203 Backend Program Module 3 Consultancy Project.  

###Built With
- ![Ruby On Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
- ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
- ![Github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
- ![BootStrap](	https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
- ![PostgresSql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

##Getting Started

### Installation
1. Get your API key from these websites
- recipe_api_key: https://spoonacular.com/food-api
- resource_api_key: https://developer.nytimes.com/
- foodbank_app_key: https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=1397
- foodbank_app_id: https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=1397
- article_api_key: https://developer.nytimes.com/
- TWITTER_API_KEY: https://developer.twitter.com/en/docs/twitter-api


Oauth credentials
- Google Oauth: https://console.cloud.google.com/
- TWITTER_API_KEY: https://developer.twitter.com/en/docs/twitter-api

2. Clone the repo
`git clone git@github.com:LukeSwenson06/waste-no-more-fe.git`

3. Move into the file
`cd waste-no-more-fe`

4. Install Gems
`bundle install`

5. Run `Bundle Exec Figaro Install` to generate `application.yml` file

6. In `application.yml` file, add api keys titled

## Features
- Users can manually input food items from their kitchen onto the app using the Add Item button.
- Users will be able to see all foods in their kitchen including foods that are 2 days from expiring and that have been expired. There will be a button to delete food that is no longer in their kitchen or delete all expired items
- Users will have access to a foodbank search, where they can input their city and find the closest foodbank.
- There is a resources page that has the latest articles on foodbanks, a donation button to donate to foodbanks, and a link to https://foodbanknews.org/ a website dedicated to bring the latest news stories on foodbanks across America
- Recipe recommendations will show on the Users Homepage tailored to what items are in their fridge. Recipes will show basic information with links to recipe show pages.
- Show pages displays information about that specific recipe with a link going to the source url.
- Add Groceries to your list that you want to buy in the future.
- Search for recipes by name or by ingredients that are not in your fridge.

## Contributions
<a href="https://github.com/LukeSwenson06/waste-no-more-fe/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=LukeSwenson06/waste-no-more-fe" />
</a>
<p>🔥@amsalmeron</p>
<p>🚀@caden-jarrett</p>
<p>🏅@DrewProebstel</p>
<p>🎊@LukeSwenson06</p>
<p>✨@ross-ian28</p>
<p>🎉@tjhaines-cap</p>
