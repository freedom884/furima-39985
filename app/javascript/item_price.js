window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.10;
    const roundedTax = Math.floor(tax);

    addTaxDom.innerHTML = `${roundedTax}`;

    const addProfitDom = document.getElementById("profit");
    const profit = inputValue - roundedTax;
    const roundedProfit = Math.floor(profit);
    
    addProfitDom.innerHTML = `${roundedProfit}`;
  });
});