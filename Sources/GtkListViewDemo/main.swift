import GLibObject
import CGtk
import Gtk

var window: ApplicationWindow!
var store: ListStore!
var listView: ListView!
var renderers = [CellRenderer]()
var columns = [TreeViewColumn]()
var i = TreeIter()

let status = Application.run(startupHandler: nil) { app in
    window = ApplicationWindow(application: app)
    window.title = "Book List Demo"
    window.setDefaultSize(width: 640, height: 360)

    do {
        i = TreeIter()
        store = ListStore(.string, .string, .boolean)
        store.append(asNextRow: i, "The Principle of Reason", "Martin Heidegger", false)
        store.append(asNextRow: i, "The Art of Computer Programming", "Donald E. Knuth", true)
        store.append(asNextRow: i, "Structure and Interpretation of Computer Programs", "Harold Abelson and Gerald J. Sussman", false)
        listView = ListView(model: store)
        columns = [
            ("Author", "text", CellRendererText()),
            ("Title",  "text", CellRendererText()),
            ("Lent", "active", CellRendererToggle())].enumerated().map {
                (i: Int, c: (title: String, kind: PropertyName, renderer: CellRenderer)) -> TreeViewColumn in
                renderers.append(c.renderer)
                let column = TreeViewColumn(i, title: c.title, renderer: c.renderer, attribute: c.kind)
                return column
        }
        listView.append(columns)
    }
    window.add(widget: listView)
    window.showAll()
}

withExtendedLifetime([window as Any, store as Any, columns, renderers, listView as Any, i]) {
    guard let status = status else {
        fatalError("Could not create Application")
    }
    guard status == 0 else {
        fatalError("Application exited with status \(status)")
    }
}
