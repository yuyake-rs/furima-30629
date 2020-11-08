window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const tax = Math.floor(inputValue/10);
    const profit = Math.floor(inputValue-(inputValue/10));
    const resultTax = tax.toLocaleString('ja-JP');
    const resultProfit = profit.toLocaleString('ja-JP');
    
    addTaxDom.innerHTML = resultTax;
    profitDom.innerHTML = resultProfit;
 })
})