let box=document.querySelector('.box');
console.log(box);
let btn=document.querySelector('.change');
console.log(btn);
btn.onclick=function () {
  box.classList.add('active')
};
box.onclick=function () {
    box.classList.remove('active')
};