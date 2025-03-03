import { FileType } from '../../constant/type'
import { GetDatetime } from '../../utils/timeHandler'
import { MemoKVStore } from '../../model/MemoKVStore'
import { inputMethod } from '@kit.IMEKit';
import { MemoFileItem } from '../MemoFileItem'

@Observed
export class mViewModel {
  curFile: MemoFileItem | undefined = undefined
  fileList: MemoFileItem[] = []
  isEditMode: boolean = false // 右侧面板是否进入编辑模式
  MemoKVInstance: MemoKVStore | undefined = undefined
  isNewFile: boolean = false
  isExpand: boolean = false // 编辑界面是否展开

  initKVStore(MemoKVInstance: MemoKVStore) {
    this.MemoKVInstance = MemoKVInstance
  }

  // 新建一个备忘录
  newMemo() {
    if (!this.isNewFile) {
      this.curFile = new MemoFileItem({
        id: (this.fileList?.length ?? 0) + 1,
        title: $r('app.string.title'),
        content: '',
        time: GetDatetime(Date.now()),
        typeColor: $r('app.color.default_folder_color'),
        folderName: $r('app.string.default'),
      })
      this.fileList?.push(this.curFile)
      this.isNewFile = true
    }
  }

  /**
   * 是否对新建文件进行编辑
   */
  editFile() {
    if (this.isNewFile) {
      this.isNewFile = false
    }
  }

  /**
   * 长期存储备忘录
   */
  saveFileToStore() {
    const isExit = this.fileList.findIndex((item) => {
      return item.id === this.curFile!.id
    })
    // 更新保存时间
    this.curFile!.time = GetDatetime(Date.now())
    if (isExit !== -1) {
      this.fileList[isExit] = this.curFile!
    } else {
      this.fileList.push(this.curFile!)
    }
    this.MemoKVInstance?.put('mFileList', JSON.stringify(this.fileList))
    this.isEditMode = false
    // 关闭键盘
    inputMethod.getController().stopInputSession()
  }

  /**
   * 切换当前编辑的备忘录
   * @param file
   */
  changeCurFile(file: MemoFileItem) {
    // 点击切换的时候保存当前备忘录
    if (!this.isNewFile) {
      this.saveFileToStore()
    }
    // 如果切换的是 不同的备忘录，且新建的没有进行编辑，那么要删除新建的备忘录
    if (this.curFile?.id !== file.id) {
      if (this.isNewFile) {
        this.isNewFile = false
        this.fileList.pop()
      }
      this.curFile = file
    }
  }
}