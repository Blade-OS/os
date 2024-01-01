/* exported init */

const Self = imports.misc.extensionUtils.getCurrentExtension()
const extensionUtils = imports.misc.extensionUtils

class Extension {
    constructor() {
        this.available_mods = Self.imports.src.modsList.get()
    }

    _refresh_mod(name) {
        if (!this.available_mods[name]) return

        let enabled, settings = false
        const value = this.settings.get_value(name)
        switch (value.get_type_string()) {
            case "s":
                if (this.mods[name]) { //disable
                    this.mods[name].disable()
                    delete this.mods[name]
                }
                settings = this.settings.get_enum(name)
                enabled = true
                break

            default:
                enabled = this.settings.get_boolean(name)
        }

        if (enabled) { // enable
            if (this.mods[name]) return

            const mod = new this.available_mods[name](settings)
            mod.enable()
            this.mods[name] = mod
        } else if (this.mods[name]) { //disable
            this.mods[name].disable()
            delete this.mods[name]
        }
    }

    enable() {
        this.mods = {}

        this.settings = extensionUtils.getSettings()

        Object.keys(this.available_mods).forEach(name => {
            this.settings.connect('changed::' + name, () => {
                this._refresh_mod(name)
            });
            this._refresh_mod(name)
        })
    }

    disable() {
        for (const key in this.mods) {
            if (!this.mods.hasOwnProperty(key)) continue;
            this.mods[key].disable()
        }

        delete this.mods
        delete this.settings
    }
}

function init() {
    return new Extension();
}
