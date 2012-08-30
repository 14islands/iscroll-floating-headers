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
<div id="myList" class="i4-ui-list">
	<ul>
		<header>C</header>
		<li>Special Agent Dale Cooper</li>
		<header>J</header>
		<li>Hank Jennings</li>
		<li>Leo Johnson</li>
		<li>Shelly Johnson</li>
		<header>H</header>
		<li>Donna Hayward </li>
		<li>Audrey Horne</li>
		<li>Benjamin Horne</li>
		<li>Big Ed Hurley</li>
		<header>P</header>
		<li>Jocelyn Packard</li>
		<li>Leland Palmer</li>
		<header>C</header>
		<li>Special Agent Dale Cooper</li>
		<header>J</header>
		<li>Hank Jennings</li>
		<li>Leo Johnson</li>
		<li>Shelly Johnson</li>
		<header>H</header>
		<li>Donna Hayward </li>
		<li>Audrey Horne</li>
		<li>Benjamin Horne</li>
		<li>Big Ed Hurley</li>
		<header>P</header>
		<li>Jocelyn Packard</li>
		<li>Leland Palmer</li>
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

Known bugs
----------
* Headers disapear after scroll momentum bounce-back at bottom
* Quickscroll doesn't update floating headers correctly