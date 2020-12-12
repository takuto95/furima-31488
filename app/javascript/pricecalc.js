function calc(){
  const item = document.getElementById("item-price");
  item.addEventListener('keyup', () => {
    const price = item.value;
    const taxprice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxcalc = (price * 0.1);
    const profitcalc = (price - taxcalc);
    taxprice.innerHTML = `${taxcalc}`;
    profit.innerHTML = `${profitcalc}`;
  });
}

window.addEventListener('load',calc);