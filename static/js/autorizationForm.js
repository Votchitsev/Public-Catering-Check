document.querySelector("input#id_username").placeholder = "Введите логин";
document.querySelector("input#id_password").placeholder = "Введите пароль";

const closeBtn = document.querySelector('.authorization-form__close');

closeBtn.addEventListener('click', (e) => {
    e.preventDefault();
    history.back();
});
