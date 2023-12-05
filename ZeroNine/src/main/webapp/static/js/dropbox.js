window.onload=()=>{
	dropdown = () => {
        var v = document.querySelector('.dropdown-content');
        var dropbtn = document.querySelector('.dropbtn')
        v.classList.toggle('show');
        dropbtn.style.borderColor = 'rgb(94, 94, 94)';
      }
      
      document.querySelector('.dropdown_btn').onclick = ()=>{
        dropdown();
      }
      
      document.getElementsByClassName('boardtype').onclick = ()=>{
        showbType(value);
      };
      

      showbType=(value)=>{
        var dropbtn_content = document.querySelector('.dropdown-content');
        var dropdown_btn = document.querySelector('.dropdown_btn');
        var dropbtn = document.querySelector('.dropbtn');

        
        dropbtn_content.innerText = value;
        dropbtn_content.style.color = '#252525';
        dropbtn.style.borderColor = '#3992a8';
      }
    }
    window.onclick= (e)=>{
      if(!e.target.matches('.dropdown_btn')){
        var dropdowns = document.getElementsByClassName("dropdown-content");

       
        var dropbtn_content = document.querySelector('.dropbtn_content');
        var dropbtn_click = document.querySelector('.dropdown_btn');
        var dropbtn = document.querySelector('.dropbtn');

        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    }