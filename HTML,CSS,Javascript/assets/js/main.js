let navbar=document.getElementById("nav")
let upArrow=document.getElementById("up")

window.addEventListener("scroll",()=>{
    if(window.scrollY>50){
        if(navbar.classList.contains("nav-close")){
            navbar.classList.remove("nav-close")
        }
        navbar.classList.add("scroll")
        upArrow.style.display="inline-block"
       
    }
    else{
        navbar.classList.remove("scroll")
        upArrow.style.display="none"
    }
})


let menuToggle=document.getElementById("toggle")
let menu=document.getElementById("mobile-menu")

menuToggle.addEventListener("click",()=>{
    let result=menuToggle.classList.toggle("open")
    if(result){
        menu.classList.add("open-menu")
        navbar.classList.add("nav-close")
    }
    else{
        menu.classList.remove("open-menu")
    }
})
upArrow.addEventListener("click",()=>{
    window.location.href="#main"
  

})
upArrow.scrollIntoView({ behavior: 'smooth'});