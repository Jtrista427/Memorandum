import { MenuHeader } from '../MenuHeader'
import { contentHeaderData } from '../../constant/MenuHeaderData'
import { FileType } from '../../constant/type'

@Component
export struct FileContent {
  fileData: FileType | undefined

  build() {
    Column({ space: 15 }) {
      MenuHeader({ headerData: contentHeaderData })
      TextArea({ text: this.fileData?.title ?? $r('app.string.title') })
        .height(40)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.White)
      Row({ space: 5 }) {
        Row() {
          Text(this.fileData?.folderName ?? $r('app.string.default'))
            .fontColor(Color.White)
          Image($r("app.media.caret_down"))
            .width(10)
            .height(10)
        }
        .align(Alignment.Center)
        .padding(5)
        .height(30)
        .borderRadius(10)
        .backgroundColor(this.fileData?.typeColor ?? Color.Yellow)

        Text(this.fileData?.time)

      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      TextArea({ text: this.fileData?.content })
        .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .padding({ top: 15, left: 10, right: 10 })
  }
}