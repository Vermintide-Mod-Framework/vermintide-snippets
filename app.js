"use strict";

const highlightMatches = (pattern) => {
  const re = new RegExp(pattern, "i")
  for (const elem of document.getElementsByClassName("snippet-index")) {
    elem.classList.toggle("highlight", !re.test(elem.innerText));
  }
}

const searchBox = document.getElementById("search-box")
searchBox.onkeyup = () => highlightMatches(searchBox.value.toLowerCase())

for (const e of document.getElementsByClassName("open-snippet")) {
  e.onclick = () => {
    return false;
  }
}
