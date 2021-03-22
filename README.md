# Take Your Pix

Take Your Pix is a Rails application that allows you to create and share albums of photos between Photographers and Clients.

## Installation

- Ensure that you have [Ruby](https://www.ruby-lang.org/en/downloads/) installed properly
- Begin by cloning the repository and navigating to the download location
- Make sure that you have all necessary gems by running:

```
bundle install
```

- Run the migrations

```
rails db:migrate
```

- Seed the database (NOTE: due to the image files, seeding may take a minute or two)

```
rails db:seed
```

## Usage

### Starting the program

To start the application:

```
rails s
```

Navigate in your web browser to the address listed in:

```
Listening on http://127.0.0.1:3000
```

In this case, it would be `http://127.0.0.1:3000`

### How to use the program

- The application opens on the homepage. From here, you may:
  - Begin the Login process by selecting what kind of account you wish to login to
    - Then, either fill out the form to login or click the button to sign in (or create new account) with Google Omniauth
  - Click on a button in the navigation bar to create either a Photographer or Client account
- Upon successfully signing in or registering, you will be brought to your profile page where you can see all your Albums(if you have any), the button to create a new Album, and the buttons to edit or delete your profile
- From here you may navigate to view many things, such as:
  - The "Best Loved" in each category
  - All Photographers
  - All Clients
  - All Albums
    - Once you have clicked on an Album, you'll be able to see all the photos
    - If you are a Photographer, you may create, edit, and delete Albums and Photos
    - If you are a Client, you may delete your Albums or Photos
    - **Note, if either a Photographer or a Client deletes their account, all associated Albums and Photos will be deleted as well**
  - Your Profile
  - Logout: You will be logged out of Take Your Pix

## License

The program is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT)

## Collaborating

Pull Requests are welcome on [GitHub](https://github.com/rebeccahickson/take-your-pix). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/cjbrock/worlds-best-restaurants-cli-gem/blob/master/contributor-covenant.org) code of conduct.

## Project Walkthrough

<a href="https://youtu.be/LMuZaFGFvaw
" target="_blank"><img src="http://img.youtube.com/vi/LMuZaFGFvaw/0.jpg" 
alt="Screenshot of project walkthrough" width="240" height="180" border="10" /></a>
