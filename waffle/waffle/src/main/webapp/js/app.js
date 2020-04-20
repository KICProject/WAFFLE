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
