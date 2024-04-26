@extends('template')
@section('content')
    <div class="container mt-4">
        <div class="box-head">
            <a href="lapangan/create" type="button" class="btn btn-primary">Tambah Data</a>

        </div>
        <div class="box-body mt-2">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Aksi</th>
                        <th scope="col">Gambar</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Harga</th>
                        <th scope="col">lokasi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($lapangans as $row)
                        <tr>
                            <th scope="row">
                                <a href="/lapangan/{{ $row->id }}/edit" type="button"
                                    class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('lapangans.destroy', $row->id) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                </form>


                            </th>
                            <td><img width="100px" src="{{ asset('storage/' . $row->gambar) }}" alt=""></td>
                            <td>{{ $row->nama }}</td>
                            <td>{{ $row->harga }}</td>
                            <td>{{ $row->lokasi }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
