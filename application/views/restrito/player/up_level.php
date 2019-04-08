<script type="text/javascript">
function exibeMsg( valor )
        {
            switch (valor)
            {
                case '':
                document.getElementById( 'txt' ).innerHTML = 'Nenhum valor informado';
                $( "#hab" ).remove();
                break;

                default:
                document.getElementById( 'txt' ).innerHTML =  valor ;
                break;
            }
        }

function altera_habilidade( id_class )
        {
            switch (id_class)
            {
                case '':
                document.getElementById( 'txt' ).innerHTML = 'Nenhum valor informado';
                  $( "#hab" ).remove();
                  $( "#hab" ).remove();

                
                break;

                default:
                var target_url = "<?=base_url()?>player/carregar_habilidades/";
                var data_to_be_sent = id_class;
                $.ajax ({
                url : target_url,
                dataType : "html",
                type: 'POST', 
                data: {id_class: data_to_be_sent}, 
                error: function(xhr, status, error) {
                  alert('deu ruim');
                },
                success: function(results){
                  var cachorro = JSON.parse(results);
                  for(var dado in cachorro){
                  $( "#hab" ).remove();
                  }
                  for(var dado in cachorro){
                    $("#habilidades").append("<p id='hab'>" + cachorro[dado].nome + " : " + cachorro[dado].efeito  +"</p>");
                  }
                }
                }); 
                return false;
                break;
           }
        }

function alteraAvatar( avatar )
        {
            switch (avatar)
            {
                case '':
                var base_url = 'http://localhost/winoworld/includes/img/'
                document.getElementById("avatar").src= base_url + "level_up.png"; 
                break;

                default:
                var base_url = 'http://localhost/winoworld/includes/img/'
                document.getElementById("avatar").src= base_url + avatar; 
                break;
            }
        }
</script>

<div class="modal fade" id="upLevel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selecione sua Classe</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form  method="POST" action='<?php echo base_url('upLevel') ?>'>
      <div class="text-center">
        <img src="<?php echo base_url('includes/img/level_up.png') ?>" id="avatar" src="" class="avatar img-circle img-thumbnail" alt="avatar">
      </div></hr><br>
      <label for="sel1">Selecione a Classe</label>
        <div class="form-group">
          <select class="form-control" data-toggle="tooltip" name="name_hab" id="sel1"  onchange="exibeMsg(this.options[this.selectedIndex].title); alteraAvatar(this.options[this.selectedIndex].id); altera_habilidade(this.options[this.selectedIndex].value)" required>
          <option value=""><p>--Selecione--<p></option>
          <?php foreach ($pegar_classes as $pc){ ?> 
            <option value='<?= $pc->id; ?>' title="<?= $pc->descricao; ?>" id="<?= $pc->avatar; ?>"><?= $pc->class_name; ?></option>
          <?php }?>
          </select>
        </div>
        <br>
        <br>
        <div class="form-group">
          <input type="hidden" name="playerid" value="<?php print_r($playerInfo['id']); ?>" class="form-control bfh-number col-sm-3">
          <input type="hidden" name="player_level" value="<?php print_r($playerInfo['level']); ?>" class="form-control bfh-number col-sm-3">
          <input type="hidden" name="player_liberado" value="<?php print_r($playerInfo['liberado']); ?>" class="form-control bfh-number col-sm-3">
          <label for="quantidade">Descrição: </label>
            <p id="txt" name="descricao"><?php print_r($pc->descricao) ?> </p>
        </div>
        <div class="form-group">
          <label for="quantidade">Habilidades:</label>
          <div id="habilidades">
          </div>
          <br>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Adicionar</button>
      </div>
      </form>
    </div>
  </div>
</div>