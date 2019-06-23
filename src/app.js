App = {

  web3Provider: null,
  contracts: {},
  status = document.getelementById('status'),
  
  init: async function() {
    return await App.initWeb3();
  },

  initWeb3: function () {
    if (typeof web3 !== "undefined") {
      App.web3Provider = web3.currentProvider;
    } 
    else {
     App.web3Provider = web3.eth.accounts; //create local variable for easy access
    }
    return App.initContract();
  },

  initContract: function () {
    Artefact.new({from: App.web3Provider[0]})
    .then( (contract) => {
      contract.EventBeingWatched().watch( (err,response) => {
        App.status.innerHTML = 'The event was successfully triggered with the value ' + response.args.someRandomValue;
      });
      setTimeout( () => {
        contract.callSmartContractFunction  (Math.random(), {from: App.web3Provider[0]});
      }, 3000);
    })
    .catch( (err)  => {
      console.log('some error occured.');
    });
  },
};

window.onload = function () {
  App.init();
};