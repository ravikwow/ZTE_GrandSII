.class Lcom/android/server/am/ActivityStackInjector;
.super Ljava/lang/Object;
.source "ActivityStackInjector.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static adjustOnTopOfHomeOfTask(Lcom/android/server/am/TaskRecord;)V
    .locals 1
    .param p0, "tr"    # Lcom/android/server/am/TaskRecord;

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/server/am/ActivityStackInjector;->isTaskAlive(Lcom/android/server/am/TaskRecord;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    .line 144
    :cond_0
    return-void
.end method

.method public static adjustOnTopOfHomeOfTopTask(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;)V
    .locals 4
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    const/4 v3, 0x1

    .line 147
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gt v2, v3, :cond_1

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 150
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/TaskRecord;

    .line 151
    .local v1, "top":Lcom/android/server/am/TaskRecord;
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/TaskRecord;

    .line 152
    .local v0, "secondaryTop":Lcom/android/server/am/TaskRecord;
    iget-boolean v2, v0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-eqz v2, :cond_0

    iget-boolean v2, v1, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/android/server/am/ActivityStackInjector;->isTaskAlive(Lcom/android/server/am/TaskRecord;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/android/server/am/ActivityStackInjector;->isTaskAlive(Lcom/android/server/am/TaskRecord;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 154
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    .line 155
    iput-boolean v3, v1, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    goto :goto_0
.end method

.method public static continueCheckTopRunningActivity(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;I)Z
    .locals 1
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .param p2, "currentIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/TaskRecord;

    iget-boolean v0, v0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getStartingWindowLabel(Lcom/android/server/am/ActivityRecord;Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 7
    .param p0, "record"    # Lcom/android/server/am/ActivityRecord;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v5, 0x40

    .line 75
    const-string v4, "getStartingWindowLabel"

    invoke-static {v5, v6, v4}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 76
    const/4 v3, 0x0

    .line 77
    .local v3, "label":Ljava/lang/CharSequence;
    invoke-static {p0, p1}, Lcom/android/server/am/ActivityStackInjector;->isStartingWindowSupported(Lcom/android/server/am/ActivityRecord;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 79
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/server/am/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 81
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, ":android:show_fragment_args"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 83
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 84
    const-string v4, ":miui:starting_window_label"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 85
    :cond_0
    if-nez v3, :cond_1

    .line 86
    const-string v4, ":miui:starting_window_label"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 93
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_1
    :goto_0
    invoke-static {v5, v6}, Landroid/os/Trace;->traceEnd(J)V

    .line 94
    return-object v3

    .line 88
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, ""

    goto :goto_0
.end method

.method static getStartingWindowLabelRes(Lcom/android/server/am/ActivityRecord;Landroid/content/Context;)I
    .locals 6
    .param p0, "record"    # Lcom/android/server/am/ActivityRecord;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v4, 0x40

    .line 58
    const-string v2, "getStartingWindowLabelRes"

    invoke-static {v4, v5, v2}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 59
    const/4 v1, 0x0

    .line 60
    .local v1, "res":I
    invoke-static {p0, p1}, Lcom/android/server/am/ActivityStackInjector;->isStartingWindowSupported(Lcom/android/server/am/ActivityRecord;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 62
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/am/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 64
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, ":android:show_fragment_title"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 70
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    invoke-static {v4, v5}, Landroid/os/Trace;->traceEnd(J)V

    .line 71
    return v1

    .line 66
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method static isStartingWindowSupported(Lcom/android/server/am/ActivityRecord;Landroid/content/Context;)Z
    .locals 9
    .param p0, "record"    # Lcom/android/server/am/ActivityRecord;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v7, 0x40

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 35
    const-string v3, "isStartingWindowSupported"

    invoke-static {v7, v8, v3}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 36
    const/4 v0, 0x0

    .line 37
    .local v0, "ret":Z
    if-eqz p1, :cond_0

    .line 39
    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Landroid/os/UserHandle;

    iget v6, p0, Lcom/android/server/am/ActivityRecord;->userId:I

    invoke-direct {v5, v6}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;

    move-result-object p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    iget v3, p0, Lcom/android/server/am/ActivityRecord;->realTheme:I

    invoke-virtual {p1, v3}, Landroid/content/Context;->setTheme(I)V

    .line 43
    invoke-static {p1}, Lmiui/os/Environment;->isUsingMiui(Landroid/content/Context;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 49
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 50
    sget v3, Lmiui/R$attr;->windowDisablePreview:I

    invoke-static {p1, v3, v2}, Lmiui/util/AttributeResolver;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v3

    if-eq v3, v1, :cond_2

    move v0, v1

    .line 53
    :cond_1
    :goto_1
    invoke-static {v7, v8}, Landroid/os/Trace;->traceEnd(J)V

    .line 54
    return v0

    :cond_2
    move v0, v2

    .line 50
    goto :goto_1

    .line 45
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private static isTaskAlive(Lcom/android/server/am/TaskRecord;)Z
    .locals 4
    .param p0, "tr"    # Lcom/android/server/am/TaskRecord;

    .prologue
    .line 120
    iget-object v3, p0, Lcom/android/server/am/TaskRecord;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 121
    const/4 v2, 0x1

    .line 130
    :cond_0
    :goto_0
    return v2

    .line 123
    :cond_1
    const/4 v2, 0x0

    .line 124
    .local v2, "isAlive":Z
    iget-object v3, p0, Lcom/android/server/am/TaskRecord;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ActivityRecord;

    .line 125
    .local v0, "activity":Lcom/android/server/am/ActivityRecord;
    iget-boolean v3, v0, Lcom/android/server/am/ActivityRecord;->finishing:Z

    if-nez v3, :cond_2

    .line 126
    const/4 v2, 0x1

    .line 127
    goto :goto_0
.end method

.method public static nextIsHome(Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)Z
    .locals 2
    .param p1, "tr"    # Lcom/android/server/am/TaskRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;",
            "Lcom/android/server/am/TaskRecord;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    iget-boolean v0, p1, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static taskAbove(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)Lcom/android/server/am/TaskRecord;
    .locals 2
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .param p2, "tr"    # Lcom/android/server/am/TaskRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;",
            "Lcom/android/server/am/TaskRecord;",
            ")",
            "Lcom/android/server/am/TaskRecord;"
        }
    .end annotation

    .prologue
    .line 111
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 112
    .local v0, "trIndex":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 113
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/TaskRecord;

    .line 115
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static transferOnTopOfHomeForMoveTask(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)V
    .locals 2
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .param p2, "tr"    # Lcom/android/server/am/TaskRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;",
            "Lcom/android/server/am/TaskRecord;",
            ")V"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    iget-boolean v1, p2, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    if-nez v1, :cond_1

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/android/server/am/ActivityStackInjector;->taskAbove(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)Lcom/android/server/am/TaskRecord;

    move-result-object v0

    .line 105
    .local v0, "trAbove":Lcom/android/server/am/TaskRecord;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/android/server/am/ActivityStackInjector;->isTaskAlive(Lcom/android/server/am/TaskRecord;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/server/am/TaskRecord;->mOnTopOfHome:Z

    goto :goto_0
.end method

.method public static transferOnTopOfHomeForMoveTaskToBackLocked(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)V
    .locals 0
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .param p2, "tr"    # Lcom/android/server/am/TaskRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;",
            "Lcom/android/server/am/TaskRecord;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    invoke-static {p0, p1, p2}, Lcom/android/server/am/ActivityStackInjector;->transferOnTopOfHomeForMoveTask(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)V

    .line 28
    return-void
.end method

.method public static transferOnTopOfHomeForMoveTaskToFrontLocked(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)V
    .locals 0
    .param p0, "thiz"    # Lcom/android/server/am/ActivityStack;
    .param p2, "tr"    # Lcom/android/server/am/TaskRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/am/ActivityStack;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/am/TaskRecord;",
            ">;",
            "Lcom/android/server/am/TaskRecord;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "taskHistory":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/TaskRecord;>;"
    invoke-static {p0, p1, p2}, Lcom/android/server/am/ActivityStackInjector;->transferOnTopOfHomeForMoveTask(Lcom/android/server/am/ActivityStack;Ljava/util/ArrayList;Lcom/android/server/am/TaskRecord;)V

    .line 32
    return-void
.end method
