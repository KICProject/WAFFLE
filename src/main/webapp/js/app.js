const menu = document.querySelector(".menu_box");

document.querySelector(".hamburg_box").onclick = function () {
  menu.classList.add("active");
};
document.querySelector(".btn_x").onclick = function () {
  menu.classList.remove("active");
};
document.querySelector(".dimmed").onclick = function () {
  menu.classList.remove("active");
};
// about tab
const aboutMenu = document.querySelectorAll(".about_menu>li");
const aboutContent = document.querySelectorAll(".about_content>li");

for (let i = 0; i < aboutMenu.length; i++) {
  const menu = aboutMenu[i];
  const content = aboutContent[i];
  menu.onclick = () => {
    for (let i = 0; i < aboutMenu.length; i++) {
      aboutMenu[i].classList.remove("active");
      aboutContent[i].classList.remove("active");
    }
    menu.classList.add("active");
    content.classList.add("active");
  };
}
// waffleService tab
const serviceTab = document.querySelectorAll(".service_tab>li");
const serviceContent = document.querySelectorAll(".service_content>li");

for(let i = 0; i < serviceTab.length; i++) {
  const tabLi = serviceTab[i];
  const contentLi = serviceContent[i];

  tabLi.onclick = () => {
    if(tabLi.classList.contains("active")) {
      tabLi.classList.remove("active");
      contentLi.classList.remove("active");
    }else{
      for (let i = 0; i < serviceTab.length; i++) {
        serviceTab[i].classList.remove("active");
        serviceContent[i].classList.remove("active");
      }
      tabLi.classList.add("active");
      contentLi.classList.add("active");
    }
  }
}


