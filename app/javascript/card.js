const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form);

    const card = {
      number: formData.get("order_buyer[number]"),
      cvc: formData.get("order_buyer[cvc]"),
      exp_month: formData.get("order_buyer[exp_month]"),
      exp_year: `20${formData.get("order_buyer[exp_year]")}`,
    };

    Payjp.createToken(card, function(status,response) {
      if (response.error){
      }
      else{
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend",tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load",pay);