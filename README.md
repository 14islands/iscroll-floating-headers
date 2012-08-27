iscroll-floating-headers
========================

A smooth implementation of floating / sticky headers for iScroll. 

Tested on: 
 * iOS5 (iPhone 4GS, iPhone 4G, iPhone 3GS, iPhone 3G, iPad 3, iPad 2)
 * Android Ice Cream Sandwich (Galaxy S2, Galaxy S3, Galaxy Tab)

Usage
-----
Just like iScroll, the first element in the element will be scrolled.

```html
<div id="myList">
    <ul>
    	<li class="header">C</li>
      <li>Special Agent Dale Cooper</li>
      <li class="header">J</li>
			<li>Hank Jennings</li>
			<li><li>Leo Johnson</li>
			<li>Shelly Johnson</li>
      <li class="header">H</li>
      <li>Donna Hayward </li>
      <li>Audrey Horne</li>
      <li>Benjamin Horne</li>
      <li>Big Ed Hurley</li>
      <li class="header">P</li>
      <li>Jocelyn Packard</li>
      <li>Leland Palmer</li>
    </ul>
  </div>
```

```javascript
new iscroll-floating-headers( document.getElementById('myList') )
``