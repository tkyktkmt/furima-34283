const pay = () => {
  Payjp.setPublicKey("pk_test_065667ce7092aff5f9e4edfa")
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_location[number]"),
      cvc: formData.get("order_location[cvc]"),
      exp_month: formData.get("order_location[exp_month]"),
      exp_year: `20${formData.get("order_location[exp_year]")}`,
    };
  
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      };

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);