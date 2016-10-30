.class Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;
.super Ljava/lang/Object;
.source "JobStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/job/JobStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WriteJobsMapToDiskRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/job/JobStore;


# direct methods
.method private constructor <init>(Lcom/android/server/job/JobStore;)V
    .locals 0

    .prologue
    .line 270
    iput-object p1, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/job/JobStore;Lcom/android/server/job/JobStore$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/job/JobStore;
    .param p2, "x1"    # Lcom/android/server/job/JobStore$1;

    .prologue
    .line 270
    invoke-direct {p0, p1}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;-><init>(Lcom/android/server/job/JobStore;)V

    return-void
.end method

.method private addIdentifierAttributesToJobTag(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V
    .locals 3
    .param p1, "out"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p2, "jobStatus"    # Lcom/android/server/job/controllers/JobStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 335
    const-string v0, "jobid"

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getJobId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 336
    const-string v0, "package"

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getServiceComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 337
    const-string v0, "class"

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getServiceComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 338
    const-string v0, "uid"

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getUid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 339
    return-void
.end method

.method private writeBundleToXml(Landroid/os/PersistableBundle;Lorg/xmlpull/v1/XmlSerializer;)V
    .locals 2
    .param p1, "extras"    # Landroid/os/PersistableBundle;
    .param p2, "out"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 343
    const-string v0, "extras"

    invoke-interface {p2, v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 344
    invoke-virtual {p1, p2}, Landroid/os/PersistableBundle;->saveToXml(Lorg/xmlpull/v1/XmlSerializer;)V

    .line 345
    const-string v0, "extras"

    invoke-interface {p2, v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 346
    return-void
.end method

.method private writeConstraintsToXml(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V
    .locals 4
    .param p1, "out"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p2, "jobStatus"    # Lcom/android/server/job/controllers/JobStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 352
    const-string v0, "constraints"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 353
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasUnmeteredConstraint()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 354
    const-string v0, "unmetered"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 356
    :cond_0
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasConnectivityConstraint()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 357
    const-string v0, "connectivity"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 359
    :cond_1
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasIdleConstraint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 360
    const-string v0, "idle"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 362
    :cond_2
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasChargingConstraint()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 363
    const-string v0, "charging"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 365
    :cond_3
    const-string v0, "constraints"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 366
    return-void
.end method

.method private writeExecutionCriteriaToXml(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V
    .locals 12
    .param p1, "out"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p2, "jobStatus"    # Lcom/android/server/job/controllers/JobStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 370
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getJob()Landroid/app/job/JobInfo;

    move-result-object v4

    .line 371
    .local v4, "job":Landroid/app/job/JobInfo;
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getJob()Landroid/app/job/JobInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 372
    const-string v5, "periodic"

    invoke-interface {p1, v11, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 373
    const-string v5, "period"

    invoke-virtual {v4}, Landroid/app/job/JobInfo;->getIntervalMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v11, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 378
    :goto_0
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasDeadlineConstraint()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 380
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getLatestRunTimeElapsed()J

    move-result-wide v7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    sub-long/2addr v7, v9

    add-long v0, v5, v7

    .line 382
    .local v0, "deadlineWallclock":J
    const-string v5, "deadline"

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v11, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 384
    .end local v0    # "deadlineWallclock":J
    :cond_0
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->hasTimingDelayConstraint()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 385
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getEarliestRunTime()J

    move-result-wide v7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    sub-long/2addr v7, v9

    add-long v2, v5, v7

    .line 387
    .local v2, "delayWallclock":J
    const-string v5, "delay"

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v11, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 393
    .end local v2    # "delayWallclock":J
    :cond_1
    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getJob()Landroid/app/job/JobInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x7530

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    invoke-virtual {p2}, Lcom/android/server/job/controllers/JobStatus;->getJob()Landroid/app/job/JobInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_3

    .line 395
    :cond_2
    const-string v5, "backoff-policy"

    invoke-virtual {v4}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v11, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 396
    const-string v5, "initial-backoff"

    invoke-virtual {v4}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v11, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 398
    :cond_3
    invoke-virtual {v4}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 399
    const-string v5, "periodic"

    invoke-interface {p1, v11, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 403
    :goto_1
    return-void

    .line 375
    :cond_4
    const-string v5, "one-off"

    invoke-interface {p1, v11, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    .line 401
    :cond_5
    const-string v5, "one-off"

    invoke-interface {p1, v11, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_1
.end method

.method private writeJobsMapImpl(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/server/job/controllers/JobStatus;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 293
    .local p1, "jobList":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 294
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v5, Lcom/android/internal/util/FastXmlSerializer;

    invoke-direct {v5}, Lcom/android/internal/util/FastXmlSerializer;-><init>()V

    .line 295
    .local v5, "out":Lorg/xmlpull/v1/XmlSerializer;
    const-string v6, "utf-8"

    invoke-interface {v5, v0, v6}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 296
    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 297
    const-string v6, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v7, 0x1

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 299
    const/4 v6, 0x0

    const-string v7, "job-info"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 300
    const/4 v6, 0x0

    const-string v7, "version"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v6, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 301
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_0

    .line 302
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/job/controllers/JobStatus;

    .line 304
    .local v4, "jobStatus":Lcom/android/server/job/controllers/JobStatus;
    const-string v6, "JobStore"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Saving job "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/android/server/job/controllers/JobStatus;->getJobId()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    const/4 v6, 0x0

    const-string v7, "job"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 307
    invoke-direct {p0, v5, v4}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->addIdentifierAttributesToJobTag(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V

    .line 308
    invoke-direct {p0, v5, v4}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->writeConstraintsToXml(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V

    .line 309
    invoke-direct {p0, v5, v4}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->writeExecutionCriteriaToXml(Lorg/xmlpull/v1/XmlSerializer;Lcom/android/server/job/controllers/JobStatus;)V

    .line 310
    invoke-virtual {v4}, Lcom/android/server/job/controllers/JobStatus;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v6

    invoke-direct {p0, v6, v5}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->writeBundleToXml(Landroid/os/PersistableBundle;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 311
    const/4 v6, 0x0

    const-string v7, "job"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 301
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 313
    .end local v4    # "jobStatus":Lcom/android/server/job/controllers/JobStatus;
    :cond_0
    const/4 v6, 0x0

    const-string v7, "job-info"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 314
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 317
    iget-object v6, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    # getter for: Lcom/android/server/job/JobStore;->mJobsFile:Landroid/util/AtomicFile;
    invoke-static {v6}, Lcom/android/server/job/JobStore;->access$100(Lcom/android/server/job/JobStore;)Landroid/util/AtomicFile;

    move-result-object v6

    invoke-virtual {v6}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object v2

    .line 318
    .local v2, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 319
    iget-object v6, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    # getter for: Lcom/android/server/job/JobStore;->mJobsFile:Landroid/util/AtomicFile;
    invoke-static {v6}, Lcom/android/server/job/JobStore;->access$100(Lcom/android/server/job/JobStore;)Landroid/util/AtomicFile;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V

    .line 320
    iget-object v6, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    const/4 v7, 0x0

    # setter for: Lcom/android/server/job/JobStore;->mDirtyOperations:I
    invoke-static {v6, v7}, Lcom/android/server/job/JobStore;->access$202(Lcom/android/server/job/JobStore;I)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1

    .line 330
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "i":I
    .end local v5    # "out":Lorg/xmlpull/v1/XmlSerializer;
    :goto_1
    return-void

    .line 321
    :catch_0
    move-exception v1

    .line 323
    .local v1, "e":Ljava/io/IOException;
    const-string v6, "JobStore"

    const-string v7, "Error writing out job data."

    invoke-static {v6, v7, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 325
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 327
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    const-string v6, "JobStore"

    const-string v7, "Error persisting bundle."

    invoke-static {v6, v7, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 273
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 274
    .local v10, "startElapsed":J
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 275
    .local v9, "mStoreCopy":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/job/controllers/JobStatus;>;"
    iget-object v12, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    monitor-enter v12

    .line 277
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    iget-object v1, v1, Lcom/android/server/job/JobStore;->mJobSet:Landroid/util/ArraySet;

    invoke-virtual {v1}, Landroid/util/ArraySet;->size()I

    move-result v1

    if-ge v7, v1, :cond_0

    .line 278
    iget-object v1, p0, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->this$0:Lcom/android/server/job/JobStore;

    iget-object v1, v1, Lcom/android/server/job/JobStore;->mJobSet:Landroid/util/ArraySet;

    invoke-virtual {v1, v7}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/job/controllers/JobStatus;

    .line 279
    .local v8, "jobStatus":Lcom/android/server/job/controllers/JobStatus;
    new-instance v0, Lcom/android/server/job/controllers/JobStatus;

    invoke-virtual {v8}, Lcom/android/server/job/controllers/JobStatus;->getJob()Landroid/app/job/JobInfo;

    move-result-object v1

    invoke-virtual {v8}, Lcom/android/server/job/controllers/JobStatus;->getUid()I

    move-result v2

    invoke-virtual {v8}, Lcom/android/server/job/controllers/JobStatus;->getEarliestRunTime()J

    move-result-wide v3

    invoke-virtual {v8}, Lcom/android/server/job/controllers/JobStatus;->getLatestRunTimeElapsed()J

    move-result-wide v5

    invoke-direct/range {v0 .. v6}, Lcom/android/server/job/controllers/JobStatus;-><init>(Landroid/app/job/JobInfo;IJJ)V

    .line 281
    .local v0, "copy":Lcom/android/server/job/controllers/JobStatus;
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 283
    .end local v0    # "copy":Lcom/android/server/job/controllers/JobStatus;
    .end local v8    # "jobStatus":Lcom/android/server/job/controllers/JobStatus;
    :cond_0
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    invoke-direct {p0, v9}, Lcom/android/server/job/JobStore$WriteJobsMapToDiskRunnable;->writeJobsMapImpl(Ljava/util/List;)V

    .line 286
    const-string v1, "JobStore"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Finished writing, took "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v3, v10

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    return-void

    .line 283
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
