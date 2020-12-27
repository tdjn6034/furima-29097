window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
      console.log(addTaxPrice);
  
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
    console.log(profit);
  })
});

