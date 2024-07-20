const hyprland = await Service.import("hyprland")
const battery = await Service.import('battery')


const Monitor = Object.freeze({
    PRIMARY: 0,
    SECONDARY: 1,
})


function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(
                `dispatch workspace ${id}`
            ),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(
                i => `${i == id ? "focused" : ""}`
            ),
        })))
    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}

const date = Variable('', {
    poll: [1000, 'date'],
})



const Bar = monitor => Widget.Window({
    monitor,
    name: `bar-${monitor}`,
    anchor: ['top', 'left', 'right'],
    child: Widget.Label({ label: date.bind() })
})

App.config({
    windows: [
        Bar(0)
        //Bar(Monitor.PRIMARY),
        //Bar(Monitor.SECONDARY),
    ],
})
