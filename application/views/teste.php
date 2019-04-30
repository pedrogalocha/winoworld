<?php
   $arr = array('WOCCOP0001', 'WOCCOP0002'); 
   for($i=0; $i<count($arr); $i++){
    exec("ping -n 1 " . $arr[$i] , $saida, $retorno);
    if (count($saida)) {
     echo ' <br>';
     echo ' A Máquina está online e os dados do PING foram gravados em $saida. : )';
     echo ' <br>';
  
    foreach($saida as $resul){
        echo ' <br>';
     echo $resul . "";
     echo ' <br>';
    }
    } else {
        echo ' <br>';
     echo ' A Máquina NÃO está online ou o host não pode ser encontrado, verifique seu endereço. :( ';
     echo '<br>';
    }
   }

?>