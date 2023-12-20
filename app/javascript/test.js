function testFuntion() {
  document.body.style.backgroundColor = 'red';
}

function addButton() {
  let button = document.createElement('div');
  button.classList.add('A_Button');
  button.innerText = 'Button';

  button.addEventListener('click', () => {
    testFuntion();
  });

  document.body.appendChild(button);
}

addEventListener('DOMContentLoaded', () => {
  if (document.body.classList.contains('welcome')) {
    addButton();
  }
});
