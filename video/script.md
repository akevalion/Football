
# PRESENTATION


Hi, in this video we will analyse a database that has data of the most important european football leagues.
We will develop tools to understand and to study this database using Pharo programming language and Roassal visualization engine.

# PROBLEM

Data analysis is a process of inspecting, cleansing, transforming, and modelling data with the goal of discovering useful information, informing conclusions, and supporting decision-making.
because of these reasons, managing and interpreting information is an important need.
Especially, when we have thousands or millions of rows, its complexity can be a great problem to solve.

We have created an example project. 

# DATABASE

For this project we will use the selected database from data dot world. They did a great job compiling and modeling a database of some European football leagues, matches, teams and players between the years 2008 and 2016. The database is around 300 megabytes in size. It contains seven tables and thousands of rows of data. With the help of Pharo we can model and build a small application.
In this picture you can see the relationships between the tables where Match is the table with the most columns and rows in the database

# DEMO

To open the application you need to go to Library and
then to click in European Leagues demo.

This will open a window with the European football leagues. This window is the Pharo inspector.

You can see in the first panel a list of leagues for the countries that we have the data.
For example the Belgium league, the Premier League, La Liga and others.

In the second panel, you can see a map of Europe with the flag
of the countries for which we have some data.
You can click in France. Like that, you will see the seasons for the french league. You can also click on Spain or Germany. But you cannot click in the countries that have no data. For example Sweden or Norway.

Let's go to the Spanish League.
In the first pane, we see a list of season.
Then we can see a list of all the teams that participated in the Spanish league.
There are 33 teams in total in which we can
see, for example, Villareal, Real Madrid and so on.

Let's see the data
of the season 2015 / 2016.
In the first panel, we can see a list of all the matches that were played on that season, this list is sorted by the date of the match.
We can search for the matches of the Real Madrid and Barcelona.

The result are the two matches that took place in this season.

In the next inspector pane, we have the table of points. The teams colored in green are classified for an European competition as the Champions League.
The last teams colored in read are the ones that are
will descend.

The third pane shows us a line graph.
This graph show each team points developement in a season.
Here the graph shows that Barcelona won the
league, but it was really tight with the second one: Real Madrid
and with the third one: Atletico Madrid.

A pop up appears when one moves the mouse over the graph.
This popup shows the points of each of the teams at a particular time of the season.

If we click on Barcelona, we see a Radar graph with the statistics of the team.
When we click on the button "Play Evolution", an animation will play with the evolution of the stats in the time.

Now, there is a table that shows the
results, like the points obtained, for all the available seasons, of Barcelona.

In the last pane for this object, there is a filtered list that shows the matches of that season.

Now we'll inspect this match in which Barcelona won 4 0 to Real Madrid.
This match has a lot of variables. Like the position in the field of each player: if they are goalkeepers, strikers, the date of the match, goals that were scored, etc.

Understanding this information is difficult at first sight. That's why we built a visualization to show this data with more meaning for humans.

To show it, we have to open the Match class and modify the method that shows the visualization in the inspector.

Now, if we inspect the other match, a nice visualization is shown instead of the raw data.

We can inspect a player by clicking on it.
Let's see Lionel Messi. We see the statistics of the player and the evolution over the time, the same as the one in teams.
Let's see now Cristiano Ronaldo. The graph has a similar shape as the one of Messi because both of them there are strikers.
By other hand, if we see the stats of a goalkeeper, as Claudio Bravo, we can see that the shape of a goalkeeper is different from the strikers.

Let's select the other goalkeeper: Keylor Navas.
The two graphs of the goalkeepers are similar.
If we check for the defenders, like Mascherano and Pepe, they also have a similar shape between them.


# CONCLUSIONS
- Pharo allows to create custom tools to understand data by placing it in a visual context.
- Pharo provides navigation tools to talk lively with the data.
- Using Pharo we can build analysing tools to present and visualize data in personalized ways.
- The graphical representations allow to spot patterns and trends that are not obviouls to see in the raw data.



