import { FileType } from '../../constant/type'
import { GetDatetime } from '../../utils/timeHandler'

@Observed
export class mViewModel {
  curFile: FileType | undefined = undefined
  fileList: FileType[] | undefined = undefined

  // 新建一个备忘录
  newMemo() {
    this.curFile = {
      id: (this.fileList?.length ?? 0) + 1,
      title: $r('app.string.title'),
      content: '',
      time: GetDatetime(Date.now()),
      typeColor: $r('app.color.default_folder_color'),
      folderName: $r('app.string.default')
    }
    this.fileList?.push(this.curFile)
  }
}