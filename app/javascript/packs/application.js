// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "chartkick/chart.js"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

  document.addEventListener("DOMContentLoaded", function() {
    var saveButtons = document.querySelectorAll(".update-btn");//edit
    var deleteButtons = document.querySelectorAll(".delete-btn");
    var createButtons = document.querySelectorAll(".add-button");
    var modal = document.getElementById("skill-modal");
    var modalMessage = document.getElementById("modal-message");
    var closeModalButton = document.getElementById("close-modal");
    
    

  // update
    saveButtons.forEach(function(button) {
      button.addEventListener("click", function(e) {
        e.preventDefault();
        console.log("save!!!!")
        // skillId, skillLevelの取得
        var userId = document.getElementById("userId").value
        var skillId = e.target.dataset.skillId //OK!!!!!!!
        var skillElem = document.getElementById("skillId-" + skillId)
        var skillName = skillElem.querySelector(".name").textContent
        var skillLevel = document.getElementById("skillLevelSelect_"+skillId).value
        console.log("user:" + userId)
        console.log("skillId:" + skillId)
        console.log("skillName" + skillName)
        console.log("skillLevel:" + skillLevel)
        
        updateSkillLevel(userId, skillId, skillName, skillLevel);
      });
    });

  // delete
    deleteButtons.forEach(function(button) {
      button.addEventListener("click", function(e) {
        e.preventDefault();
        var userId = document.getElementById("userId").value
        var skillId = e.target.dataset.skillId;
        var skillElem = document.getElementById("skillId-" + skillId)
        var skillName = skillElem.querySelector(".name").textContent
        console.log("delete");
        console.log("user:" + userId)
        console.log(skillId + " : " + skillName);
        // console.log("delete:" + skillId)
        deleteSkill(userId, skillId, skillName);
      });
    });
    
    createButtons.forEach(function(button){
      button.addEventListener("click", function(e) {
        e.preventDefault();
        var userId = document.getElementById("userId").value
        var skillName = document.getElementById("skill_detail_skill_name").value
        var skillLevel = document.getElementById("skill_detail_skill_level").value
        var categoryId = document.getElementById("categoryId").value
        var categoryName = document.getElementById("categoryName").value
        // console.log("add");
        // console.log(skillName + skillLevel)

        createSkill(userId, skillName, skillLevel, categoryId, categoryName)
        // console.log(userId, skillName, skillLevel)
      });
    });

    closeModalButton.addEventListener("click", function(e) {
      e.preventDefault();
      modal.style.display = "none";
      var userId = document.getElementById("userId").value;
      var host = window.location.host;
      window.location.href = 'https://' + host + '/user_skill/' + userId + '/edit';
    });

    function updateSkillLevel(userId, skillId, skillName, skillLevel) {
      var request = new XMLHttpRequest();
      // userIdに変更
      request.open("PUT", "/user_skill/" + userId + "/edit", true);
      
      request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      request.onload = function() {
        if (request.status === 200) {
          showModal(skillName + " の習得レベルを保存しました！");
        } else {
          showModal(skillName + " の習得レベルの保存に失敗しました。");
        }
      };
      // skillIdを追加
      request.send(JSON.stringify({ skill_id: skillId, skill_level: skillLevel }));
    }

    function deleteSkill(userId, skillId, skillName) {
      var request = new XMLHttpRequest();
      request.open("DELETE", "/user_skill/" + userId + "/edit", true);
      request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      request.onload = function() {
        if (request.status === 200) {
          showModal(skillName + " の項目を削除しました！");
          // Optionally, remove the deleted skill from the DOM
          var skillItem = document.getElementById("skillId-" + skillId);
          if (skillItem) {
            skillItem.parentNode.removeChild(skillItem);
          }
        } else {
          showModal(skillName + " の項目の削除に失敗しました。お手数ですが再度お試しください。");
        }
      };
      request.send(JSON.stringify({ skill_id: skillId }));
    }
    
    function createSkill(userId, skillName, skillLevel, categoryId, categoryName){
      var request = new XMLHttpRequest();
      request.open("POST", "/user_skill/" + userId + "/category/" + categoryId, true)
      request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      request.onload = function() {
        if (request.status === 200) {
          showModal(categoryName + "に" + skillName + "を習得レベル" + skillLevel + "で追加しました！");
        } else {
          showModal(skillName + " の項目の追加に失敗しました。お手数ですが再度お試しください。");
        }
      };
      request.send(JSON.stringify({ skill_name: skillName, skill_level: skillLevel }));
    }

    function showModal(message) {
      modalMessage.textContent = message;
      modal.style.display = "block";
      console.log("showModal!!!!")
    }
  });
