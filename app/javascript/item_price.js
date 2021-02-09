function calculation() {
  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")

  itemPrice.addEventListener("input",function () {
    const price = itemPrice.value;
    const tax = Math.floor(price * 0.1)
    const profit = Math.floor(price * 0.9);
    taxPrice.innerHTML = tax
    gain.innerHTML = profit
  })
 }
  window.addEventListener('load', calculation);
