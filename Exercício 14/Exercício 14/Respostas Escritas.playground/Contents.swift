import UIKit

// 1) - Crie uma TableView personalizada e fazendo uso do JSON disponilizado. A TableView deverá ter no mínimo, uma imagem e duas labels.

// Feita no Projeto!!!

// 2) - Eu tenho 20 células. Em cada célula, tenho 2 botões. Como posso verificar na TableView qual botão da célula foi clicado? (O uso do Delegate)

// CellTableViewController:

protocol CellDelegate {
    func BotãoFoiPressionado(cell: cell)
}

class cell: UITableViewCell {

    weak var delegate: CellDelegate?

    func buttonTapAction() {
        delegate?.BotãoFoiPressionado(cell: self)
    }
}

// Aqui criamos um protocol que possui um parâmetro que indica se um botão dentro da cell foi pressionado.


// ViewController:
class ViewController: CellDelegate {

    let tableView: UITableView

    func BotãoFoiPressionado(cell: MyCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            print("Usuário apertou a célula: \(indexPath.row)")
        }
    }
}

// Na ViewController adicionamos o protocolo criado para que nossa viewcontroller "siga" os parâmetros desejados para a indicação de quando um botão foi pressionado.

print("3) - Explique a diferença entre a UITableViewDataSource e UITableViewDelegate?")


// O DataSource fornece os dados que irão formar uma TableView, ele edita, popula e mostra os dados dentro de uma TableView.

// Métodos DataSource: canEditRowAt, cellForRowAt...

// O Delegate fornece os o comportamento que a TableView irá ter

// Métodos Delegte: didSelectRow, willDisplay, heightForRow...
