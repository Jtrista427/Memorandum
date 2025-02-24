import { MenuHeader } from '../MenuHeader'
import { contentHeaderData } from '../../constant/MenuHeaderData'
import { mViewModel } from '../../model/viewmodel/mViewModel'

@Component
export struct FileContent {
  @ObjectLink memoViewModel: mViewModel | undefined

  build() {
    Column({ space: 15 }) {
      MenuHeader({ headerData: contentHeaderData })
      TextArea({
        placeholder: $r('app.string.title'),
        text: this.memoViewModel?.curFile?.title
      })
        .height(40)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.White)
        .padding({ left: 5 })
      Row({ space: 5 }) {
        Row() {
          Text(this.memoViewModel?.curFile?.folderName ?? $r('app.string.default'))
            .fontColor(Color.White)
          Image($r("app.media.caret_down"))
            .width(10)
            .height(10)
        }
        .align(Alignment.Center)
        .padding(5)
        .height(30)
        .borderRadius(10)
        .backgroundColor(this.memoViewModel?.curFile?.typeColor ?? Color.Yellow)

        Text(this.memoViewModel?.curFile?.time)

      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      TextArea({ text: this.memoViewModel?.curFile?.content })
        .backgroundColor(Color.White)
        .padding({ left: 5 })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 15, left: 10, right: 10 })
  }
}