const pinnedApps = [
    "preferred://filemanager",
    "preferred://browser",
    "applications:discord.desktop",
    "applications:signal.desktop",
    "applications:steam.desktop",
    "applications:org.kde.konsole.desktop",
    "applications:github-desktop.desktop",
    "applications:code.desktop",
    "applications:xivlauncher.desktop",
];
const allPanels = panels();
for (const panel of allPanels || []) {
    const taskBarWidgets = panel.widgets("org.kde.plasma.icontasks");

    for (const taskBar of taskBarWidgets || []) {
        taskBar.currentConfigGroup = ["General"];
        taskBar.writeConfig("groupingStrategy", 0);
        taskBar.writeConfig("launchers", pinnedApps);
    }
}
