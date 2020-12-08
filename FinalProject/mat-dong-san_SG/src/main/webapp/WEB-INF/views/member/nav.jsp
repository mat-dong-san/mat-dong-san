<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
nav {
  position: relative;
  display: flex;
  width: 1000px;
  margin: 4em auto;
}
nav a {
  display: block;
  width: 20%;
  padding: .75em 0;
  color: #333;
  text-decoration: none;
  text-align: center;
}
.nav-underline {
  position: absolute;
  left: 0;
  bottom: -2px;
  width: 20%;
  height: 2px;
  background: #333;
  transition: all .3s ease-in-out;
}
nav a:nth-child(1).is-current ~ .nav-underline {
  left: 0;
}
nav a:nth-child(2).is-current ~ .nav-underline {
  left: 20%;
}
nav a:nth-child(3).is-current ~ .nav-underline {
  left: 40%;
}
nav a:nth-child(4).is-current ~ .nav-underline {
  left: 60%;
}
nav a:nth-child(5).is-current ~ .nav-underline {
  left: 80%;
}

nav a:nth-child(1):hover ~ .nav-underline {
  left: 0;
}
nav a:nth-child(2):hover ~ .nav-underline {
  left: 20%;
}
nav a:nth-child(3):hover ~ .nav-underline {
  left: 40%;
}
nav a:nth-child(4):hover ~ .nav-underline {
  left: 60%;
}
nav a:nth-child(5):hover ~ .nav-underline {
  left: 80%;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
  <a href="#">Primary</a>
  <a href="#">Secondary</a>
  <a href="#" class="is-current">Tertiary</a>
  <a href="#">Quaternary</a>
  <a href="#">Quinary</a>
  <div class="nav-underline">
  
  </div>
</nav>

</body>
</html>