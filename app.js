"use strict"

document.getElementById("vs-code").textContent = `\
                     ..  .            ....                      
                .''.;xd:l:.          .ldxl,,;;.                 
               .lOOx0WXKXd.         .lOKNK0XX0:                 
               .xWWNWMMWWd.         ;KWWMWMMMK;                 
                :XMMMMMMWd.         cXMMMMMMWx.                 
                .OWMMMMMWd.         lNMMMMMMXc                  
                .oNMMMMMWd.         oNMMMMMMO'                  
                 ;KMMMMMWd.        .dWMMMMMNo.                  
                 .xWMMMMWd.        .oXMMMMMK:                   
                  :KMMMMWx.         .xWMMMWk.                   
                  .dWMMMWx.         .dWMMMNl                    
                   cXMMMWx.         .xWMMM0,                    
                   cXMMMNl          .kWMMWd.                    
                   ,0MMMWd.         .kMMMX:                     
                   .xWMMM0,         .OMMWk.                     
                    lNMMMK;         'OMMNl                      
                    ,0MMMX:         '0MMK,                      
                    .kWMMK;         '0MWk.                      
                     oNMMO'         '0MNo.                      
                     ;KWM0'         '0MX:                       
                     .oKW0,         ,0MO'                       
                      .dNK;         ;KWd.                       
                       ;0K:         cXXc                        
                       .x0c         lN0,                        
                       .:xl.        :Kx.                        
                        .:l.        ;kc                         
                         .:.        :x,                         
                          '.        co.                         
                                    ::                          
                                    '.                          
`

// Search.
document.getElementById("vs-search").onkeyup = function () {
  const re = new RegExp(this.value.toLowerCase(), "i")
  for (const elem of document.getElementsByClassName("vs-snippet-entry")) {
    elem.classList.toggle("d-none", !re.test(elem.innerText))
  }
}

// Select from list.
const code = document.getElementById("vs-code")
const title = document.getElementById("vs-title")
const download = document.getElementById("vs-download")
let selected
const setActive = (a) => {
  if (!a) return;
  if (selected) selected.classList.remove("active")
  a.classList.add("active")
  selected = a
  history.replaceState(null, "", "#!" + a.pathname.replace(/^\/$/g, ""))
  fetch(a.href)
    .then((response) => response.text())
    .then((text) => {
      code.textContent = text
      Prism.highlightElement(code)
      const str = a.getElementsByClassName("vs-list-title")[0].textContent
      document.title = str + " | VT Snippets"
      title.textContent = str
      download.href = a.href
    })
}

for (const entry of document.getElementsByClassName("vs-snippet-entry")) {
  entry.onclick = function(e) {
    e.preventDefault()
    setActive(this)
  }
}

setActive(document.querySelector(`a[href='${window.location.hash.substr(2)}']`))

const copy = document.getElementById("vs-copy")
new ClipboardJS(copy).on("success", (e) => {
  e.clearSelection()
})
