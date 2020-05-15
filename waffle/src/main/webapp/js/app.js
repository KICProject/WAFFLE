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
//about image slider
(function () {
const customers = [];
let index = 0;

// 생성자 함수
function Customer(img, text) {
    this.img = img;
    this.text = text;
}

function createCustomer(img, text) {
    const fullImg = `/img/about_img_${img}.jpg`;
    const customer = new Customer(fullImg, text);
    customers.push(customer);
}

createCustomer(0, "WAFFLE is \nIoT \nWeb Service");
createCustomer(1, "대한민국을 넘어 \n세계로 향합니다.");
createCustomer(2, "WAFFLE은 \n친환경 친휴먼 짱짱맨 \nIoT 서비스 입니다.");

console.log(customers);

document.querySelectorAll('.btn').forEach(function(item) {

    item.addEventListener('click', function (e) {

        e.preventDefault();

        // console.log(e.target);
        if (e.target.classList.contains('prevBtn')) {

            // 배열의 가장 앞 데이터에 접근했을 때
            if (index === 0) {
                index = customers.length;
            }

            index--;
            document.getElementById('story_img').src = customers[index].img;
            document.getElementById('story_text').textContent = customers[index].text;

        }

        if (e.target.classList.contains('nextBtn')) {
            // 배열의 가장 끝 데이터에 접근했을 때
            if (index === (customers.length - 1)) {
                index = -1;
            }

            index++;
            document.getElementById('story_img').src = customers[index].img;
            document.getElementById('story_text').textContent = customers[index].text;

        }

    })
})
}) ();
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


