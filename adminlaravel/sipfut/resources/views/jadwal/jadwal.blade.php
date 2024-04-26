@extends('template')
@section('content')
    <div class="container mt-4">
        <div class="box-head">
            <a href="jadwal/create" type="button" class="btn btn-primary">Tambah Data</a>

        </div>
        <div class="box-body mt-2">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Aksi</th>
                        <th scope="col">Waktu</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($datas as $row)
                        <tr>
                            <th scope="row">
                                <a href="/jadwal/{{ $row->id }}/edit" type="button"
                                    class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('jadwal_lapangans.destroy', $row->id) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                </form>


                            </th>
                            <td>{{ $row->jam }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
