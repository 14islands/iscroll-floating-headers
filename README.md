iscroll-floating-headers
========================

A smooth implementation of floating / sticky headers for iScroll. 

Device support
--------------
A grade:
 * iPhone 4GS (iOS5)
 * iPhone 4G  (iOS5)
 * iPhone 3GS (iOS5)
 * iPad 3     (iOS5)
 * iPad 2     (iOS5)
 * Galaxy S3  (Ice Cream Sandwich)
 * Galaxy S2  (Ice Cream Sandwich)

B grade: (works but performance is bad)
 * iPhone 3G       (iOS4)
 * Galaxy Tab 10.1 (Honeycomb)

Usage
-----
Just like iScroll, the first element in the element will be scrolled.

```html
<div id="myList">
	<ul>
		<li class="header">A</li>
		<li>Andrew Packard (6 episodes, 1990-1991)</li>
		<li>Annie Blackburn (6 episodes, 1991)</li>
		<li>Asian Man / ... (2 episodes, 1990)</li>
		<li>Asian Man / ... (5 episodes, 1990)</li>
		<li>Audrey Horne (30 episodes, 1990-1991)</li>
		<li class="header">B</li>
		<li>Bartender (2 episodes, 1991)</li>
		<li>Benjamin Horne (30 episodes, 1990-1991)</li>
		<li>Bernard Renault (2 episodes, 1990)</li>
		<li>Betty Briggs (7 episodes, 1990-1991)</li>
		<li>Big Ed Hurley (30 episodes, 1990-1991)</li>
		<li>Blackie O'Reilly (7 episodes, 1990)</li>
		<li>Bobby Briggs (30 episodes, 1990-1991)</li>
		<li>Bob / ... (11 episodes, 1990-1991)</li>
		<li class="header">C</li>
		<li>Cappy (2 episodes, 1990-1991)</li>
		<li>Caroline / ... (2 episodes, 1991)</li>
		<li>Catherine Martell / ... (27 episodes, 1990-1991)</li>
		<li>Chet (segment 'Invitation To Love') (5 episodes, 1990)</li>
		<li>Coach Wingate (2 episodes, 1990-1991)</li>
		<li class="header">D</li>
		<li>D.A. Daryl Lodwick (2 episodes, 1990)</li>
		<li>DEA Agent Dennis / ... (3 episodes, 1990-1991)</li>
		<li>Deputy Andy Brennan (26 episodes, 1990-1991)</li>
		<li>Deputy Tommy 'Hawk' Hill (28 episodes, 1990-1991)</li>
		<li>Dick Tremayne (11 episodes, 1990-1991)</li>
		<li>Donna Hayward (30 episodes, 1990-1991)</li>
		<li>Dougie Milford (3 episodes, 1990-1991)</li>
		<li>Dr. Jacoby / ... (16 episodes, 1990-1991)</li>
		<li>Dr. Will Hayward (30 episodes, 1990-1991)</li>
		<li class="header">E</li>
		<li>Eileen Hayward (11 episodes, 1990-1991)</li>
		<li>Einar Thorson (3 episodes, 1990)</li>
		<li>Emerald (segment 'Invitation To Love') / ... (3 episodes, 1990)</li>
		<li>Emory Battis (5 episodes, 1990)</li>
		<li>Ernie Niles (5 episodes, 1990-1991)</li>
		<li>Evelyn Marsh (5 episodes, 1990-1991)</li>
		<li class="header">F</li>
		<li>FBI Agent Albert Rosenfield (8 episodes, 1990-1991)</li>
		<li>FBI Agent Roger Hardy (2 episodes, 1990)</li>
		<li>FBI Regional Bureau Chief Gordon Cole (6 episodes, 1990-1991)</li>
		<li class="header">G</li>
		<li>Giant / ... (5 episodes, 1990-1991)</li>
		<li>Girl Singer / ... (2 episodes, 1990)</li>
		<li class="header">H</li>
		<li>Hank Jennings (13 episodes, 1990-1991)</li>
		<li>Harold Smith (4 episodes, 1990)</li>
		<li>Harriet Hayward (2 episodes, 1990)</li>
		<li>Heavy Metal Youth (2 episodes, 1991)</li>
		<li>Heba (2 episodes, 1990)</li>
		<li>Heidi (2 episodes, 1990-1991)</li>
		<li class="header">J</li>
		<li>Jacques Renault (3 episodes, 1990)</li>
		<li>James Hurley (30 episodes, 1990-1991)</li>
		<li>Jared (segment 'Invitation To Love') (3 episodes, 1990)</li>
		<li>Jean Renault (5 episodes, 1990-1991)</li>
		<li>Jeffrey Marsh (2 episodes, 1991)</li>
		<li>Jenny (2 episodes, 1990)</li>
		<li>Jerry Horne (9 episodes, 1990-1991)</li>
		<li>Jocelyn Packard (30 episodes, 1990-1991)</li>
		<li>Joey / ... (3 episodes, 1990)</li>
		<li>John Justice Wheeler (5 episodes, 1991)</li>
		<li>Johnny Horne / ... (4 episodes, 1990-1991)</li>
		<li>Jones (4 episodes, 1991)</li>
		<li>Judge Clinton Sternwood (2 episodes, 1990)</li>
		<li class="header">L</li>
		<li>Lana Budding Milford (6 episodes, 1990-1991)</li>
		<li>Leland Palmer (18 episodes, 1990-1991)</li>
		<li>Leo Johnson (24 episodes, 1990-1991)</li>
		<li>Log Lady / ... (12 episodes, 1990-1991)</li>
		<li>Lucy Moran (29 episodes, 1990-1991)</li>
		<li class="header">M</li>
		<li>Madeleine 'Maddy' Ferguson / ... (18 episodes, 1990-1991)</li>
		<li>Major Garland Briggs (16 episodes, 1990-1991)</li>
		<li>Malcolm Sloan (3 episodes, 1991)</li>
		<li>Man From Another Place / ... (4 episodes, 1990-1991)</li>
		<li>Mayor Dwayne Milford / ... (8 episodes, 1990-1991)</li>
		<li>Mike Nelson (13 episodes, 1990-1991)</li>
		<li>Montana (segment 'Invitation To Love') / ... (4 episodes, 1990)</li>
		<li class="header">N</li>
		<li>Nadine Hurley (22 episodes, 1990-1991)</li>
		<li>Nancy / ... (3 episodes, 1990)</li>
		<li>New Girl at One Eyed Jacks (2 episodes, 1990)</li>
		<li>Nicky (2 episodes, 1990-1991)</li>
		<li>Norma Jennings (30 episodes, 1990-1991)</li>
		<li class="header">P</li>
		<li>Pete Martell (30 episodes, 1990-1991)</li>
		<li>Phillip Michael Gerard / ... (10 episodes, 1990)</li>
		<li class="header">R</li>
		<li>RCMP Officer Preston King (2 episodes, 1990-1991)</li>
		<li>Randy St. Croix (5 episodes, 1991)</li>
		<li>Rev. Clarence Brocklehurst (2 episodes, 1990)</li>
		<li>Ronette Pulaski / ... (5 episodes, 1990-1991)</li>
		<li class="header">S</li>
		<li>Sarah Palmer (13 episodes, 1990-1991)</li>
		<li>Shelly Johnson (30 episodes, 1990-1991)</li>
		<li>Sheriff Harry S. Truman (30 episodes, 1990-1991)</li>
		<li>Sheriff's Deputy (2 episodes, 1990)</li>
		<li>Sid (2 episodes, 1990)</li>
		<li>Special Agent Dale Cooper (30 episodes, 1990-1991)</li>
		<li>Sylvia Horne (4 episodes, 1990-1991)</li>
		<li class="header">T</li>
		<li>The Dead Man (2 episodes, 1991)</li>
		<li>Thomas Eckhardt (3 episodes, 1991)</li>
		<li>Tim Pinkle (3 episodes, 1990-1991)</li>
		<li>Toad (4 episodes, 1990-1991)</li>
		<li>Trudy / ... (7 episodes, 1990-1991)</li>
		<li class="header">V</li>
		<li>Vivian Smythe Niles (3 episodes, 1990)</li>
		<li class="header">W</li>
		<li>Waiter (4 episodes, 1990-1991)</li>
		<li>Wilson Mooney (2 episodes, 1990)</li>
		<li>Windom Earle (10 episodes, 1990-1991)</li>
	</ul>
</div>
```

```javascript
new iscrollFloatingHeaders( document.getElementById('myList') )
```

Requires
--------
iScroll 4.2.2
Zepto.js 1.0rc1
requestAnimationFrame