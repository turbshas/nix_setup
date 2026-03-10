const allPanels = panels();
for (const panel of allPanels || []) {
    const taskBarWidgets = panel.widgets("org.kde.plasma.icontasks");

    for (const taskBar of taskBarWidgets || []) {
        taskBar.currentConfigGroup = ["General"];
        taskBar.writeConfig("groupingStrategy", 0);
    }
}
