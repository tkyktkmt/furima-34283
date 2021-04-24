function itemPrice() {
  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit");
  
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    addTax.innerHTML = Math.floor(inputValue * 0.1);
    addProfit.innerHTML = Math.ceil(inputValue * 0.9);
  })
}
window.addEventListener('load', itemPrice)