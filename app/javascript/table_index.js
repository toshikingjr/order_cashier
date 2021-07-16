function hide(){
  const hideMenu = document.querySelectorAll(".menu_output");

  hideMenu.forEach(function(menu) {
    menu.addEventListener("click", () => {
      menu.setAttribute("style", "display:none;");
    });
  });
};

window.addEventListener('load', hide);