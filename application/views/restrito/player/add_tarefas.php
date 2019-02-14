<!-- Modal -->
<div class="modal fade" id="addTarefa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Tarefa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form  method="POST" action=''> 
      <label for="sel1">Selecione a Missão</label>
        <div class="form-group">
          <select class="form-control"  id="sel1" data-live-search="true" required>
          <option><p><p></option>
          <?php foreach ($tasks as $tk){ ?> 
            <option id='<?= $tk->id; ?>'><?= $tk->name_task; ?></option>
          <?php }?>
          </select>
        </div>
        <br>
        <br>
        <div class="form-group">
          <label for="quantidade">Quantidade</label>
            <input type="text" class="form-control bfh-number col-sm-3">
        </div>
        <div class="form-group">
          <label for="quantidade">N° Chamado</label>
            <input type="text" class="form-control bfh-number col-sm-3">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>