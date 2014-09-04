#CoffeeSpots

##Table of Contents

* [Screenshot](#screenshot)
* [General Description](#general-description)
* [Functional Description](#functional-description)
* [Browsers](#browsers)
* [Testing](#testing)
* [License](#license)


##Screenshot

<table>
	<tr>
		<td align="center" width="220px" >
			<a href="https://raw.githubusercontent.com/nadavmatalon/CoffeeSpots/master/app/assets/images/coffeespots-screenshot.jpg">
				<img src="coffeespots-screenshot.jpg" height="105px" />
			</a>
		</td>
	</tr>
</table>


##General Description

<p><strong>CoffeeSpots</strong> is a simple web app for collecting and storing user 
reviews about their favourite coffee-shops.</p>

<p>The first iteration of this app was created while pair-programming with 
[Roi Driscoll](https://github.com/roidriscoll) and it represents our first encouter 
with [Ruby on Rails](http://rubyonrails.org/) during week 8 of 
the course at [Makers Academy](http://www.makersacademy.com/).

The name 'CoffeeSpots' was [Roi's](https://github.com/roidriscoll) idea.

<p>Later itterations included minor functional upgrades, code refactoring amd updating
of the testing suite.</p>

The app is based on a [PostgreSQL](http://www.postgresql.org/) database  
and impletemts [Devise](https://github.com/plataformatec/devise) for user authentication.</p>

<p>It was written according to [TDD](http://en.wikipedia.org/wiki/Test-driven_development), 
and uses [Rspec](http://rspec.info) and [Capybara](https://github.com/jnicklas/capybara) 
for testing.</p>


##Functional Description

* All users (register & unregistered) can see the list of CoffeeSpots & reviews
* Users can see the 'show' page for a specific CoffeeSpot by clicking on its name
* Users can go to a Coffeeshop webpage by clicking on its Url link
* Users can see the 'show' page for a specific CoffeeSpot by clicking its name
* Users can see the 'show' page for a specific review by clicking on the name of its author
* Registered users can see, edit or delete their accounts
* Only registered users can add new CoffeeSpots and/or reviews
* Only the user who added a specific CoffeeSpot can edit or delete it
* Only the user who added a specific review can edit or delete it


##Browsers

 This app has been tested with and supports the following browsers:

* __Google Chrome__ (36.0)
* __Mozilla Firefox__ (31.0)
* __Apple Safari__ (7.0.5)


##  Testing

Tests were written with [Rspec](http://rspec.info) (2.14.8) & 
[Capybara](https://github.com/jnicklas/capybara) (2.3.0).

The tests cover both back-end logic and front-end functionality.

To run the tests in terminal: 

```bash
$ rspec
```

##  License

<p>Released under the <a href="http://www.opensource.org/licenses/MIT">MIT license</a>.</p>

