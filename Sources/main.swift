import GLibObject
import CGtk
import Gtk

let status = Application.run { app in
    var window = ApplicationWindowRef(application: app)
    window.title = "Book List Demo"
    window.setDefaultSize(width: 640, height: 360)

    let listView: ListView
    do {
        let store = ListStore(.string, .string, .boolean)
        var i = TreeIter()
        store.append(asNextRow: i, "The Principle of Reason", "Martin Heidegger", false)
        store.append(asNextRow: i, "The Art of Computer Programming", "Donald E. Knuth", true)
        store.append(asNextRow: i, "Structure and Interpretation of Computer Programs", "Harold Abelson and Gerald J. Sussman", false)
        listView = ListView(model: store)
        let columns = [
            ("Author", "text", CellRendererText()),
            ("Title",  "text", CellRendererText()),
            ("Lent", "active", CellRendererToggle())].enumerated().map {
                (i: Int, c: (title: String, kind: PropertyName, renderer: CellRenderer)) -> TreeViewColumn in
                var column = TreeViewColumn(i, title: c.title, renderer: c.renderer, attribute: c.kind)
                return column
        }
        listView.append(columns)
    }
    window.add(widget: listView)
    window.showAll()
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
