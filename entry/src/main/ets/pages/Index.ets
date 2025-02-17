import { MemoMenu } from '../components/Menu/Menu';
import { KVStore } from '../model/KVStore';

@Entry
@Component
struct Index {
  @State fullMode: boolean = false;
  @Provide KVInstance: KVStore = KVStore.getInstance()

  aboutToAppear(): void {
  }

  @Builder
  FileDetail() {
    Text('detail')
  }

  build() {
    Row() {
      MemoMenu()
        .width('50%')
      this.FileDetail()
    }
    .width('100%')
    .height('100%')
  }
}