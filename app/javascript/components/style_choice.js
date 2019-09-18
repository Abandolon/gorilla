

function handleClick(e){
    this.parentElement.classList.toggle("active");

    // console.log({name: e.target.name, value: e.target.value});
}
const selects = document.querySelectorAll('.check-me');
selects.forEach(select => select.addEventListener('click', handleClick))

function handleClickProducts(e){
    this.parentElement.classList.toggle("active");

    // console.log({name: e.target.name, value: e.target.value})
}
const selected = document.querySelectorAll('.check-this');
selected.forEach(select => select.addEventListener('click', handleClickProducts))
