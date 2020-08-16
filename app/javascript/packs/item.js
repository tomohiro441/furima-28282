  function price() {
  const input = document.getElementById("item-price")
  input.addEventListener('input', function(){ 
    const item_price = document.getElementById("item-price").value;
    const add_tax_price = item_price * 0.1;
    const profit = item_price - add_tax_price;
    document.getElementById("add-tax-price").innerHTML = add_tax_price;
    document.getElementById("profit").innerHTML = profit
  })
}
window.addEventListener("load", price);